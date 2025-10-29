#!/usr/bin/env python3
"""
Quick start script for the Cheqr backend server
"""
import uvicorn
import sys
import os

# Add backend to path
sys.path.insert(0, os.path.dirname(__file__))

if __name__ == "__main__":
    uvicorn.run(
        "backend.main:app",
        host="0.0.0.0",
        port=8000,
        reload=True  # Auto-reload on code changes
    )

