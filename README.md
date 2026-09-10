# 🌊 Flood Risk Prediction Assistant
### AI-Powered Hydrological Early Warning & Disaster Resilience Assistant

[![Python](https://img.shields.io/badge/Python-3.10%2B-blue.svg)](https://python.org)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.110%2B-009688.svg)](https://fastapi.tiangolo.com)
[![React](https://img.shields.io/badge/React-18-61dafb.svg)](https://react.dev)
[![TailwindCSS](https://img.shields.io/badge/TailwindCSS-3.4-38bdf8.svg)](https://tailwindcss.com)
[![Scikit--Learn](https://img.shields.io/badge/Scikit--Learn-1.4%2B-orange.svg)](https://scikit-learn.org)
[![SQLite](https://img.shields.io/badge/SQLite-3-003B57.svg)](https://sqlite.org)

---

## 📌 Project Overview

The **Flood Risk Prediction Assistant** is a full-stack, machine-learning-driven web application designed to evaluate, classify, and mitigate hydrological flood hazards. Using a multi-variate machine learning model trained on physics-informed environmental features, the system classifies flood vulnerability into four standardized tiers:

- 🟢 **Low Risk (0% – 35%)**: Safe conditions, normal drainage absorption, baseline flow.
- 🟡 **Moderate Risk (35% – 65%)**: Elevated water levels and high soil moisture; potential localized street ponding.
- 🟠 **High Risk (65% – 85%)**: Embankments near saturation, high runoff; safety precautions and go-bag preparation required.
- 🔴 **Severe Risk (85% – 100%)**: Critical river overtopping and imminent flash flooding; mandatory evacuation guidance.

In addition to predictive classification, the platform features:
- 🗺️ **Interactive Geospatial Map**: Leaflet map featuring real-time river monitoring stations across major river systems with color-coded risk markers.
- 🤖 **FloodGuard AI**: A safety-first conversational chatbot providing emergency guidance, evacuation checklists, and hydrological explanations.
- 📊 **Live Telemetry Dashboard**: Real-time sensory feeds with Chart.js hydrographs showing rainfall vs. river water level correlation and soil moisture trends.
- 🗄️ **Prediction Audit History**: Persistent SQLite database storing previous assessments with filtering and CSV/JSON export.

---

## 🏗️ System Architecture

```
                                  +---------------------------------------+
                                  |         React 18 User Interface       |
                                  |   (Tailwind CSS + Leaflet + Chart.js) |
                                  +-------------------+-------------------+
                                                      |
                                                      | HTTP / REST API (JSON)
                                                      v
                                  +---------------------------------------+
                                  |         FastAPI Python Backend        |
                                  |   (Pydantic Validation, CORS, Routers)|
                                  +---------+-------------------+---------+
                                            |                   |
                     +----------------------+                   +---------------------+
                     |                                                                |
                     v                                                                v
+------------------------------------+                               +------------------------------------+
|       Machine Learning Engine      |                               |       SQLite Relational DB         |
|  - Scikit-learn (Random Forest)    |                               |  - Persistent Prediction Records   |
|  - Feature Importance Explanations |                               |  - Environmental Sensor Logs       |
|  - Dynamic Safety Recommendations  |                               |  - Auto-Seeded Demo Datasets       |
+------------------------------------+                               +------------------------------------+
```

---

## 🔬 Machine Learning Pipeline & Performance

### 1. Environmental Features
1. **`rainfall_mm`**: Observed 24-hour precipitation (mm).
2. **`river_water_level_m`**: Hydrological water level at local river gauge (m).
3. **`soil_moisture_pct`**: Ground saturation and infiltration capacity (%).
4. **`temperature_c`**: Ambient air temperature (°C).
5. **`humidity_pct`**: Relative atmospheric humidity (%).
6. **`wind_speed_kmh`**: Wind velocity influencing storm surge (km/h).
7. **`expected_rainfall_mm`**: Forecasted precipitation in next 24 hours (mm).
8. **`previous_flood_history`**: Low-elevation / historical basin vulnerability (Binary 0 or 1).

### 2. Multi-Model Benchmark Comparison
The system generates a realistic 2,500-sample hydrological dataset with natural physics-based correlations and evaluates three algorithms:

| Algorithm | Accuracy | Weighted Precision | Weighted Recall | F1-Score |
| :--- | :---: | :---: | :---: | :---: |
| **Random Forest Classifier (Selected)** | **84.80%** | **84.66%** | **84.80%** | **84.40%** |
| Logistic Regression | 89.60% | 89.69% | 89.60% | 89.49% |
| Decision Tree Classifier | 80.40% | 79.92% | 80.40% | 79.70% |

### 3. Predictive Feature Importances
- 🌊 **River Water Level**: **29.37%**
- 🌧️ **Observed Rainfall**: **24.17%**
- 📅 **Forecasted Rainfall**: **14.82%**
- 🌱 **Soil Moisture Saturation**: **12.77%**
- 💧 **Atmospheric Humidity**: **6.01%**
- 📜 **Previous Flood History**: **5.32%**
- 💨 **Wind Speed**: **3.82%**
- 🌡️ **Temperature**: **3.72%**

---

## 📁 Project Folder Structure

```
1mb1 project/
├── backend/
│   ├── app/
│   │   ├── __init__.py
│   │   ├── main.py              # FastAPI application, CORS, and unified static serving
│   │   ├── config.py            # Paths, constants, and color schemes
│   │   ├── database.py          # SQLite database schema, CRUD, and demo seeder
│   │   ├── models.py            # Pydantic validation schemas
│   │   ├── ml_engine.py         # Model inference, risk percentage, and factor breakdown
│   │   ├── chatbot_engine.py    # FloodGuard AI reasoning and safety engine
│   │   └── mock_stations.py     # River monitoring stations data for map & dashboard
│   ├── data/
│   │   └── flood_dataset.csv    # 2,500-sample hydrological dataset
│   ├── ml/
│   │   ├── train_model.py       # Model training and benchmark script
│   │   ├── flood_model.joblib   # Trained Random Forest model
│   │   └── model_metrics.json   # Model evaluation benchmarks and confusion matrix
│   ├── test_api.py              # Backend API test suite
│   └── requirements.txt         # Python dependencies
├── frontend/
│   ├── index.html               # Entry HTML with Leaflet CSS and typography
│   ├── package.json             # NPM dependencies (React, Vite, Lucide, Leaflet, Chart.js)
│   ├── vite.config.js           # Vite configuration with /api reverse proxy
│   ├── tailwind.config.js       # Environmental and risk color scheme
│   ├── postcss.config.js        # PostCSS configuration
│   ├── dist/                    # Compiled production build served by FastAPI
│   └── src/
│       ├── main.jsx             # React DOM root
│       ├── App.jsx              # Core navigation, page router, and alert manager
│       ├── index.css            # Tailwind directives and custom UI styling
│       ├── components/
│       │   ├── Navbar.jsx       # Header navigation with active alert indicators
│       │   ├── AlertBanner.jsx  # High/Severe risk alert system with safety checklist
│       │   ├── RiskGauge.jsx    # Semicircular animated gauge for flood risk percentage
│       │   └── Disclaimer.jsx   # Academic presentation demo disclaimer
│       ├── pages/
│       │   ├── HomePage.jsx     # Hero section, feature pillars, and live basin snapshot
│       │   ├── PredictPage.jsx  # Environmental inputs form, presets, and inference output
│       │   ├── DashboardPage.jsx# Telemetry tiles, Chart.js hydrographs, and risk donuts
│       │   ├── MapPage.jsx      # Leaflet geospatial map with color-coded risk pins
│       │   ├── ChatbotPage.jsx  # FloodGuard AI conversational safety assistant
│       │   ├── HistoryPage.jsx  # SQLite prediction audit table with CSV/JSON export
│       │   └── AboutPage.jsx    # Model benchmarks, confusion matrix, and tech stack
│       └── services/
│           └── api.js           # REST API client wrapper
├── run.bat                      # Windows One-Click Unified Launcher
├── run_backend.bat              # Standalone FastAPI Uvicorn launcher
├── run_frontend.bat             # Standalone Vite development server launcher
├── run_server.py                # Python unified server script (FastAPI + React dist)
└── README.md                    # Project documentation
```

---

## 🚀 Installation & Running Instructions

### Option 1: One-Click Startup (Recommended for Windows)
Simply double-click:
```cmd
run.bat
```
This script checks the Python environment, ensures the model is trained, launches the unified FastAPI server on `http://127.0.0.1:8000`, and opens your default browser automatically.

---

### Option 2: Manual Startup via Terminal

#### 1. Setup Backend:
```bash
# Install Python dependencies
pip install -r backend/requirements.txt

# Train or retrain ML models (produces flood_model.joblib and model_metrics.json)
python backend/ml/train_model.py

# Run backend API unit tests
python backend/test_api.py

# Start the unified server (Serves both API and Frontend at port 8000)
python run_server.py
```
Open **`http://127.0.0.1:8000`** in your browser.
API Swagger documentation is accessible at **`http://127.0.0.1:8000/docs`**.

---

### Option 3: Full Development Mode (Hot-Reloading Frontend + Backend)

If you wish to edit React components with instant hot module replacement:

**Terminal 1 (Backend):**
```bash
python -m uvicorn backend.app.main:app --host 127.0.0.1 --port 8000 --reload
```

**Terminal 2 (Frontend):**
```bash
cd frontend
npm install
npm run dev
```
Open **`http://localhost:5173`**. Vite automatically proxies `/api` calls to the FastAPI backend on port 8000.

---

## 📡 REST API Reference

| Method | Endpoint | Description |
| :--- | :--- | :--- |
| `GET` | `/api/health` | Health check and ML model status |
| `POST` | `/api/predict` | Computes flood risk, logs to SQLite, and returns factors + safety tips |
| `GET` | `/api/history` | Fetches logged predictions with pagination (`limit`, `offset`) |
| `DELETE`| `/api/history/{id}` | Deletes a specific prediction record |
| `DELETE`| `/api/history` | Clears all prediction history records |
| `GET` | `/api/stations` | Retrieves all river monitoring stations for the map |
| `GET` | `/api/stations/{id}` | Fetches detailed telemetry for a single station |
| `GET` | `/api/model-info` | Returns model evaluation benchmarks, confusion matrix, and feature weights |
| `POST` | `/api/chat` | Converses with FloodGuard AI with optional prediction context |

### Sample Prediction Request (`POST /api/predict`)
```json
{
  "location": "Mumbai (Mithi Basin)",
  "rainfall_mm": 190.0,
  "temperature_c": 28.0,
  "humidity_pct": 94.0,
  "river_water_level_m": 8.5,
  "soil_moisture_pct": 92.0,
  "wind_speed_kmh": 42.0,
  "expected_rainfall_mm": 140.0,
  "previous_flood_history": true
}
```

### Sample Prediction Response
```json
{
  "timestamp": "2026-09-08T01:15:00Z",
  "location": "Mumbai (Mithi Basin)",
  "risk_level": "Severe Risk",
  "risk_code": 3,
  "risk_percentage": 92.8,
  "probabilities": {
    "Low Risk": 0.0,
    "Moderate Risk": 0.0,
    "High Risk": 5.8,
    "Severe Risk": 94.2
  },
  "contributing_factors": [
    {
      "factor": "River Water Level",
      "impact": "Critical",
      "score": 8.5,
      "detail": "8.5m is above the danger threshold (7.0m). Embankment overflow imminent."
    }
  ],
  "explanation": "Severe flood hazard detected for Mumbai (Mithi Basin). The primary driver is River Water Level. With river level at 8.5m, soil moisture at 92.0%, and 190.0mm rainfall, surface runoff is at maximum capacity.",
  "safety_recommendations": [
    "🚨 EVACUATE IMMEDIATELY if instructed by local civil protection authorities.",
    "🚫 NEVER attempt to walk, swim, or drive through flowing water.",
    "⚡ Shut off main electricity breakers and gas valves."
  ],
  "alert_triggered": true
}
```

---

## 🎯 Viva & Presentation Demonstration Scenarios

Use these four presets during your project presentation to demonstrate each risk tier:

1. **Monsoon Flash Flood (Severe Risk - 🔴)**:
   - Location: `Mumbai` | River Level: `8.5m` | Rainfall: `190mm` | Soil Moisture: `92%`
   - *Result*: Triggers immediate flashing emergency alert banner, red risk gauge, and evacuation recommendations.
2. **River Surge Warning (High Risk - 🟠)**:
   - Location: `Guwahati` | River Level: `6.9m` | Rainfall: `110mm` | Soil Moisture: `84%`
   - *Result*: High risk alert, go-bag preparation instructions, and upper-floor asset relocation advice.
3. **Continuous Drizzle (Moderate Risk - 🟡)**:
   - Location: `London` | River Level: `3.9m` | Rainfall: `45mm` | Soil Moisture: `62%`
   - *Result*: Moderate risk badge, gutter clearing and drain inspection tips.
4. **Dry Summer Baseline (Low Risk - 🟢)**:
   - Location: `Phoenix` | River Level: `1.5m` | Rainfall: `2mm` | Soil Moisture: `18%`
   - *Result*: Green indicator, standard seasonal status.

---

## ⚠️ Academic Disclaimer

> **Student Project & Demonstration Model**:
> The **Flood Risk Prediction Assistant** is engineered for educational, demonstration, and academic evaluation purposes. The prediction models are trained on simulated physics-based hydrological indices. **It is not certified for operational emergency forecasting or life-critical disaster management.** In real-world flood situations, always comply strictly with official instructions issued by national disaster management agencies (IMD, NOAA, NDRF, Environment Agency).
