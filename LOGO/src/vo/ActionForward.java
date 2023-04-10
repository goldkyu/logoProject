package vo;

public class ActionForward {
	private boolean isRedirect = false; // 경로이동 방식 (Redirect인지 foward인지) 여부
	private String path = null; // 이동할 페이지의 경로 저장 변수

	public boolean isRedirect() {
		return isRedirect;
	}

	public String getPath() {
		return path;
	}

	public void setRedirect(boolean b) {
		isRedirect = b;
	}

	public void setPath(String string) {
		path = string;
	}
}