# Elektron---Google-Girl-Hackathon-2025
### Combinational Logic Depth Prediction Project

This project demonstrates an AI-based solution to predict the combinational logic depth (or delay as a proxy) of critical signals in RTL designs without running full synthesis. The solution integrates synthesis timing metrics, netlist structural features (fan-in), and mapping information to build a comprehensive dataset used for training a Random Forest regression model. The final model is evaluated via cross-validation and residual analysis, and deployment instructions are provided for real-time inference via a FastAPI REST API.

## Repository Contents

- **final_project_notebook.ipynb**  
  A clean, well-documented Jupyter Notebook that covers the complete workflow:
  - Data ingestion and merging
  - Exploratory data analysis (EDA)
  - Feature engineering
  - Model training, evaluation, and cross-validation
  - Residual analysis
  - (Optional) Model deployment code snippet

- **sdf_mapped_signals.csv**  
  Mapping file containing the original RTL signal names and their corresponding synthesized net names.

- **sdf_final_timing_dataset.csv**  
  Timing dataset extracted from SDF files, including metrics such as rise/fall delays and estimated depth.

- **fan_in_data_corrected_with_debug.csv**  
  Extracted fan-in data from the synthesized netlist with debugging information.

- **merged_timing_and_fanin.csv**  
  Merged dataset combining timing data (after applying the mapping) with fan-in data.

- **merged_engineered_dataset.csv**  
  Final dataset after additional feature engineering (e.g., delay per area, area per depth).

- **api.py** (Optional)  
  FastAPI deployment script for real-time inference.

## Setup and Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/zoey-11/Elektron---Google-Girl-Hackathon-2025.git
   cd Elektron---Google-Girl-Hackathon-2025

   ```

2. **Create and activate a virtual environment (recommended):**

   ```bash
   python3 -m venv venv
   source venv/bin/activate  # On Windows, use venv\Scripts\activate
   ```

3. **Install the required packages:**

   ```bash
   pip install -r requirements.txt
   ```

   Alternatively, install dependencies manually:

   ```bash
   pip install pandas numpy scikit-learn matplotlib seaborn fastapi uvicorn joblib
   ```

4. **Ensure that all CSV and netlist files are placed in the correct directories:**

   - `/mnt/data/sdf_mapped_signals.csv`
   - `/mnt/data/sdf_final_timing_dataset.csv`
   - `/mnt/data/fan_in_data_corrected_with_debug.csv`

   Adjust paths in the notebook if necessary.

## Running the Notebook

1. **Launch Jupyter Notebook:**

   ```bash
   jupyter notebook
   ```

2. **Open `final_project_notebook.ipynb` and run each cell sequentially.**  
   The notebook is organized into sections:
   - Data ingestion & merging
   - EDA
   - Feature engineering
   - Model training & evaluation
   - Residual analysis
   - (Optional) Deployment instructions

   Running the cells in order should produce the same results as reported (model metrics, cross-validation scores, residual plots, etc.).

## Reproducing Results

- **Data Files:**  
  Ensure that the CSV files mentioned above are available in the paths specified in the notebook.
  
- **Notebook Execution:**  
  Running the notebook from start to finish on a compatible Python environment (with the required packages installed) will reproduce the merged dataset, engineered features, and model training results.  
  - You should see output files such as `merged_timing_and_fanin.csv` and `merged_engineered_dataset.csv` generated during execution.
  - Model performance metrics (MAE, RMSE, R²) and cross-validation scores should match those documented in the notebook.

## (Optional) Deploying the Model as an API

If you wish to deploy the model:

1. **Ensure the model is saved (e.g., as `optimized_logic_depth_model.pkl`).**

2. **Run the API script:**

   ```bash
   uvicorn api:app --reload
   ```

3. **Test the endpoint:**  
   Open a browser and navigate to `http://127.0.0.1:8000/docs` to interact with the FastAPI interactive documentation, where you can send POST requests with the required features.

## References and Appendices

- **Synthesis and Timing Analysis Tools:**  
  - Yosys Open Synthesis Suite  
  - SDF and SDC Documentation
- **Public Datasets:**  
  - MetRex dataset and relevant documentation
  - https://github.com/TimingPredict/Dataset (i used the raw netlists from here itself)
- **Machine Learning:**  
  - Random Forest Regression and cross-validation techniques
- **Deployment:** (optional) 
  - FastAPI and Uvicorn documentation
