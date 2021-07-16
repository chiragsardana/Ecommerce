package SBK.Utilities;

public class Covid19FAQ {
	public Covid19FAQ() {
		super();
	}
	public Covid19FAQ(String question, String answer) {
		super();
		this.question = question;
		this.answer = answer;
	}
	private String question;
	private String answer;
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "Covid19FAQ [question=" + question + ", answer=" + answer + "]";
	}
}
