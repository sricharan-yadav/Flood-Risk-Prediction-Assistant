"""
Flood Risk Prediction Assistant - Unified Server Runner
Runs the FastAPI application and serves both the REST API and the built React frontend.
"""

import os
import sys
import webbrowser
import uvicorn

# Ensure project root is in sys.path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

def start():
    print("=" * 70)
    print("🌊 FLOOD RISK PREDICTION ASSISTANT - LAUNCHER")
    print("=" * 70)
    print("Starting backend API and serving frontend on http://127.0.0.1:8000 ...")
    print("API Documentation available at: http://127.0.0.1:8000/docs")
    print("=" * 70)

    # Automatically open browser after server start
    try:
        webbrowser.open("http://127.0.0.1:8000")
    except Exception:
        pass

    uvicorn.run("backend.app.main:app", host="127.0.0.1", port=8000, reload=False)

if __name__ == "__main__":
    start()
