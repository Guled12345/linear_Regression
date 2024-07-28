from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import numpy as np
import joblib

app = FastAPI()

# Load the trained model
model = joblib.load('model (1).pkl')

# Load the scaler object
scaler = joblib.load('scaler.pkl')

class PredictionRequest(BaseModel):
    Pregnancies: float
    Glucose: float
    BloodPressure: float
    SkinThickness: float
    Insulin: float
    BMI: float
    DiabetesPedigreeFunction: float
    Age: float

@app.post("/predict")
async def predict(request: PredictionRequest):
    try:
        # Extract features from the request
        features = np.array([[request.Pregnancies, request.Glucose, request.BloodPressure, 
                              request.SkinThickness, request.Insulin, request.BMI, 
                              request.DiabetesPedigreeFunction, request.Age]])
        
        # Scale the input features
        scaled_features = scaler.transform(features)
        
        # Make prediction
        prediction = model.predict(scaled_features)
        
        # Convert prediction to percentage
        percentage_prediction = prediction[0] * 100  # Assuming the prediction is a probability between 0 and 1
        
        return {"prediction": f"{percentage_prediction:.2f}%"}
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)
