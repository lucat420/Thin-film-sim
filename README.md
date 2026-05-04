# Optical Interference Filter Simulator - Lab Project

## Project Objective
This project is an interactive numerical simulator for thin-film optical filters. The program calculates the reflectance and transmittance of multi-layer structures using real-world refractive index data. Its primary purpose is to analyze how manufacturing thickness tolerances (deposition errors) impact the final spectral performance of a filter.

## Technical Specifications
* **Physical Engine:** Implementation of the **Abelès Characteristic Matrix Method** for multi-layer stacks.
* **Material Data:** Direct integration with the `refractiveindex` database, supporting both dielectrics ($n$) and metals ($n + ik$).
* **Error Analysis:** Monte Carlo module to simulate spectral shifts caused by manufacturing variations (e.g., **±2 nm** thickness errors).
* **Interactive UI:** A dashboard built with `ipywidgets` and rendered via `Voila` for real-time parameter tuning.

## Theoretical Foundation
The simulator calculates the system response by defining a characteristic matrix $M_j$ for each layer $j$:

$$M_j = \begin{pmatrix} \cos\phi_j & -\frac{i}{n_j}\sin\phi_j \\ -in_j\sin\phi_j & \cos\phi_j \end{pmatrix}$$

Where $\phi_j = \frac{2\pi n_j d_j}{\lambda}$ is the phase thickness. The total response of the stack is the product of all individual layer matrices: $M = \prod M_j$. 

The complex reflection coefficient $r$ is derived from the field amplitudes $B$ and $C$ at the system boundary:
$$B = m_{11} + m_{12}n_s, \quad C = m_{21} + m_{22}n_s$$
$$r = \frac{n_0 B - C}{n_0 B + C}, \quad R = |r|^2$$

Where $n_0$ is the incident medium and $n_s$ is the substrate index.

## Tech Stack
* **Python 3.x**
* **NumPy:** For complex matrix algebra and array operations.
* **Matplotlib:** For spectral visualization and sensitivity plots.
* **refractiveindex:** Local database wrapper for real-world material constants.
* **ipywidgets & Voila:** For the interactive dashboard interface.

## 🚀 Quick Start

### Windows
1. Download and extract the repository.
2. Double-click **`Sim_app.bat`**.
3. The script will automatically set up a virtual environment, install dependencies, and launch the dashboard in your browser.

### Linux
1. Open a terminal in the project folder.
2. Grant execution permissions to the launcher script:
   ```bash
   chmod +x Sim_app.sh