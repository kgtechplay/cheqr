from fastapi import FastAPI
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware
import sys
import os

from .checker import check_statement

app = FastAPI()

# Allow requests from Flutter app
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # For local testing; restrict later
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class Statement(BaseModel):
    text: str

@app.post("/check")
def check_text(statement: Statement):
    result, verdict = check_statement(statement.text)
    return {"result": result, "verdict": verdict}

@app.get("/")
def root():
    return {"message": "Cheqr API is running"}

