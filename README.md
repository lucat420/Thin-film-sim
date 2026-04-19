# Computational Modeling of Nanophotonic Interference Filters

## Project Objective
This repository contains a high-fidelity numerical simulator for thin-film optical filters, utilizing the **Transfer Matrix Method (TMM)**. The goal is to model the reflectance and transmittance of multi-layered nanostructures with research-grade precision, bridging the gap between theoretical optics and manufacturing reality.

## Technical Specifications
* **Core Physics:** Rigorous implementation of Fresnel equations for arbitrary angles of incidence and TE/TM polarization.
* **Complex Refractive Indices:** Native support for dissipative and metallic materials using the complex index notation ($\tilde{n} = n + ik$).
* **Dispersion Models:** Real-time calculation of wavelength-dependent indices via the **Sellmeier Equation**.
* **Engineering Analysis:** Manufacturing tolerance module using **Monte Carlo Simulations** to predict spectral shifts caused by deposition errors ($\pm 2$ nm).

## Theoretical Foundation
The simulator calculates the total system response by concatenating characteristic matrices $M_j$ for each layer and interface. The total transfer matrix $M$ relates the electric and magnetic fields at the input and output boundaries:

$$M_{total} = \prod_{j=1}^{N} M_{interface, j} \cdot M_{propagation, j} = \begin{pmatrix} m_{11} & m_{12} \\ m_{21} & m_{22} \end{pmatrix}$$

The complex reflectance $r$ and transmittance $t$ are derived from the global matrix elements:
$$r = \frac{m_{21}}{m_{11}}, \quad R = |r|^2$$

## Tech Stack
* **Python 3.x**
* **NumPy:** Complex linear algebra for high-performance matrix operations.
* **SciPy:** Numerical optimization of layer thicknesses for specific stop-band targets.
* **Matplotlib:** High-resolution spectral response visualization.
* **Voila & IPyWidgets:** Used to render the notebook as a **standalone interactive dashboard**, separating the physics engine from the user interface.

## 🚀 Quick Start

This project is designed for zero-configuration execution. You do not need to manually install libraries if you use the provided launchers.

### Windows
1. Download and extract the repository.
2. Double-click **`Sim_app.bat`**.
   - *Automated:* The script creates a virtual environment, installs all scientific dependencies, and launches the simulator as a standalone window.

### macOS / Linux
1. Open Terminal in the project folder.
2. Run: `chmod +x Sim_app.sh && ./Sim_app.sh`

