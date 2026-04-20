import ipywidgets as widgets
from IPython.display import display, clear_output
from refractiveindex import refractiveindex as ri_sub

def create_linked_control(label, val, min_v, max_v):
    """Links a slider to a text box for precise input without trailing zeros."""
    s = {'description_width': 'initial'}
    # Slider for quick adjustments
    slider = widgets.FloatSlider(value=val, min=min_v, max=max_v, step=0.000001, readout=False, style=s)
    # Text box for manual precision (e.g., 2.3345)
    text = widgets.FloatText(value=val, step=0.000001, description=label, style=s, layout={'width': '180px'})
    
    # Synchronize the two widgets
    widgets.jslink((slider, 'value'), (text, 'value'))
    return widgets.HBox([text, slider]), text

def launch_interface(callback):
    # Load database once for the combobox
    catalog = ri_sub._load_catalog(ri_sub._DEFAULT_DB_PATH)
    mat_options = sorted({k[1] for k in catalog.keys()})
    
    # Material selection
    mat_input = widgets.Combobox(options=mat_options, description='Material:', style={'description_width': 'initial'})
    
    # Create the linked UI components
    thick_ui, thick_val = create_linked_control('Thickness (nm):', 325.0, 0.1, 1000.0)
    err_ui, err_val = create_linked_control('Error (nm):', 2.0, 0.0, 10.0)
    n_ui, n_val = create_linked_control('Manual n:', 2.4, 1.0, 5.0)

    run_btn = widgets.Button(description='Run Simulation', button_style='primary')
    output = widgets.Output()

    def on_click(_):
        with output:
            clear_output(wait=True)
            user_val = mat_input.value.strip()
            try:
                # Use as numeric n if the user typed a float
                selected = float(user_val)
            except:
                # Otherwise use as material name or default to slider
                selected = user_val if user_val else n_val.value
            
            callback([(selected, thick_val.value)], error_nm=err_val.value, iterations=20)

    run_btn.on_click(on_click)

    header = widgets.HTML("<h2>Optical Simulator</h2>")
    footer = widgets.HTML("<div style='text-align: right; margin-top: 20px; font-style: italic; color: gray;'>"
                         "Developed by Țurlea Luca-Alexandro</div>")

    return widgets.VBox([
        header, 
        widgets.HBox([mat_input, n_ui]),
        widgets.HBox([thick_ui, err_ui]),
        run_btn, 
        output, 
        footer
    ])