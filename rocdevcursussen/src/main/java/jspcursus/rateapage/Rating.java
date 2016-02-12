package jspcursus.rateapage;

public class Rating {
	Page page;
	int rating;
	RatingStudent student;
	
	public Rating(Page page, int rating, RatingStudent student) {
		this.page = page;
		this.rating = rating;
		this.student = student;
	}
	
	public Rating() {
		this.page = null;
		this.rating = 0;
		this.student = null;
	}
	
	public RatingStudent getStudent() {
		return student;
	}
	public void setStudent(RatingStudent student) {
		this.student = student;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	
	

}
