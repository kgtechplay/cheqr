from openai import OpenAI
from typing import List, Tuple
from dotenv import load_dotenv
import os

load_dotenv('config.env')

def decompose_statement_to_questions(
    statement: str,
    model: str = "gpt-4",
) -> Tuple[List[str], int]:
    """
    Decomposes a factual statement into atomic questions to enable fact-checking.
    
    Args:
        statement (str): The input factual statement to decompose.
        model (str): Model name to use for completion (default: gpt-4).
        
    Returns:
        List[str]: A list of atomic questions.
    """
    client = OpenAI(api_key=os.getenv('OPENAI_API_KEY'))
    
    prompt = f"""
Given the following factual statement, break it into individual atomic questions that can be independently verified.

Statement: "{statement}"

Atomic questions:"""

    response = client.chat.completions.create(
        model=model,
        messages=[
            {"role": "system", "content": "You are a helpful assistant that verifies facts by breaking statements into verifiable sub-questions. Please try to break each question into sub-questions based on all the nouns and objects in the statement. For example, the statement Elon Musk is the 10th richest man in the world with a net worth of 100 billion dollars can be broken into the following questions: Is Elon Musk the 10th richest man in the world? Is Elon Musk's net worth 100 billion dollars? Is Elon Musk a man? Please ensure each question can be answered with a yes or no and an answer yes means that the original statement is true and an answer no means that the original statement is false. Please only include items from the statement that are objective facts"},
            {"role": "user", "content": prompt}
        ],
        temperature=0.3,
        max_tokens=300
    )

    result = response.choices[0].message.content
    questions = [q.strip("- ").strip() for q in result.split("\n") if q.strip()]
    return questions, len(questions)

# Example usage
if __name__ == "__main__":
    test_statement = "Sachin scored 100 in his last test match"
    atomic_questions = decompose_statement_to_questions(test_statement)
    for idx, q in enumerate(atomic_questions, 1):
        print(f"{idx}. {q}")
