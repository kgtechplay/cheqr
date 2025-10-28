import os
from dotenv import load_dotenv

# Load environment variables from config.env file
load_dotenv('config.env')

# Get the Tavily API key
tavily_api_key = os.getenv('TAVILY_API_KEY')

if tavily_api_key:
    print("Tavily API key loaded successfully!")
    # Your code here
else:
    print("Please set your TAVILY_API_KEY in the config.env file")
