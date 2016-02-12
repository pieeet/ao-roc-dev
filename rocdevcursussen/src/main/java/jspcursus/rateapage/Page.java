package jspcursus.rateapage;

public class Page {
	private String url;
	RatingStudent eigenaar;
//	private int aantalRatings;
//	private double gemiddeldeRating;
	
	
	
	public Page(String url, int rating) {
		this.url = url;
		
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	
	
	
}
