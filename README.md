# Cheqr - AI-Powered Fact-Checking Tool

A Python-based fact-checking tool that uses AI to verify statements by breaking them down into verifiable questions and searching for evidence.

## Features

- **Statement Decomposition**: Breaks down complex factual statements into atomic questions using GPT-4
- **Evidence Search**: Uses Tavily API to search for relevant information
- **Binary Verification**: Determines if statements are true or false based on evidence

## Setup

1. Clone the repository:
```bash
git clone https://github.com/kgtechplay/cheqr.git
cd cheqr
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Create a `config.env` file with your API keys:
```
TAVILY_API_KEY=your_tavily_api_key
OPENAI_API_KEY=your_openai_api_key
```

## Usage

### Basic Fact-Checking
```python
from checker import check_statement

result = check_statement("Your factual statement here")
print(result)  # True or False
```

### Decompose Statements
```python
from break_statement import decompose_statement_to_questions

questions, count = decompose_statement_to_questions("Your statement")
for q in questions:
    print(q)
```

### Search and Verify
```python
from search_results import yes_no

answer = yes_no("Is your question verifiable?")
print(answer)  # "Yes" or "No"
```

## Project Structure

- `main.py` - Main entry point
- `checker.py` - Core fact-checking logic
- `break_statement.py` - Statement decomposition functionality
- `search_results.py` - Tavily search integration and verification
- `config.env` - Environment variables (not tracked)
- `requirements.txt` - Python dependencies

## License

MIT

## Author

kgtechplay

