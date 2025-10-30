from . import search_results
from . import break_statement

def check_statement(statement: str) -> tuple[list[tuple[str, str]], bool]:
    verdict = True
    results = []
    questions, num_questions = break_statement.decompose_statement_to_questions(statement)
    print(questions, num_questions)
    for question in questions:
            #print(question, search_results.yes_no(question))   
            answer = search_results.yes_no(question)
            value = (question, answer)
            results.append(value)
            # If any answer is "No", the overall verdict is False
            if answer == "No":
                verdict = False
    return (results, verdict)


if __name__ == "__main__":
    print(check_statement("is Narendra Modi the 11th Prime Minister of India?"))
    