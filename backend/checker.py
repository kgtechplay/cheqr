from . import search_results
from . import break_statement

def check_statement(statement: str) -> bool:
    questions, num_questions = break_statement.decompose_statement_to_questions(statement)
    for question in questions:
            if search_results.yes_no(question) == "No":
                return False
    return True

if __name__ == "__main__":
    print(check_statement("Sachin scored 100 in his last test match"))