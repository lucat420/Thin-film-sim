import ipywidgets as widgets
from IPython.display import display, clear_output

def launch_interface(simulation_callback):
    thickness_slider = widgets.IntSlider(value=100, min=10, max=500, description='Thickness (nm):')
    n_input = widgets.FloatSlider(value=1.38, min=1.0, max=4.0, step=0.01, description='Material (n):')
    error_slider = widgets.FloatSlider(value=2.0, min=0, max=10, step=0.5, description='Error (nm):')
    run_button = widgets.Button(description='Run Simulation', button_style='success', icon='play')

    output_area = widgets.Output()

    def on_button_clicked(b):
        with output_area:
            clear_output(wait=True)
            d = thickness_slider.value
            n = n_input.value
            err = error_slider.value

            current_stack = [(n, d)]
            simulation_callback(current_stack, error_nm=err, iterations=20)

    run_button.on_click(on_button_clicked)

    app_layout = widgets.VBox([
        widgets.HTML("<h2>Optical Filter Simulator</h2>"),
        widgets.HBox([n_input, thickness_slider]),
        widgets.HBox([error_slider, run_button]),
        output_area
    ])

    display(app_layout)