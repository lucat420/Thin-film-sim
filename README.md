# Computational Modeling of Nanophotonic Interference Filters

## Project Objective
This repository contains a high-fidelity numerical simulator for thin-film optical filters, utilizing the **Transfer Matrix Method (TMM)**. The goal is to model the reflectance and transmittance of multi-layered nanostructures with research-grade precision.

## Technical Specifications
* **Core Physics:** Implementation of Fresnel equations for arbitrary angles of incidence.
* **Complex Refractive Indices:** Native support for dissipative materials ($\tilde{n} = n + ik$).
* **Dispersion Models:** Real-time calculation of wavelength-dependent indices via the **Sellmeier Equation**.
* **Engineering Analysis:** Manufacturing tolerance sensitivity module ($\pm 2$ nm).

## Tech Stack
* **Python 3.x**
* **NumPy:** Complex linear algebra for matrix concatenation.
* **SciPy:** Optimization of layer thicknesses.
* **Matplotlib:** Spectral response visualization.