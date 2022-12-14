package entity;

public class ExamQuestion {
    private int examId;
    private Question[]  questions;

    public ExamQuestion() {

    }

    public ExamQuestion (int examId,Question[] questions) {
        this.examId = examId;
        this.questions = questions;
    }

    public int getExamId() {
        return examId;
    }

    public void setExamId(int examId) {
        this.examId = examId;
    }

    public Question[] getQuestions() {
        return questions;
    }

    public void setQuestions(Question[] questions) {
        this.questions = questions;
    }
}
