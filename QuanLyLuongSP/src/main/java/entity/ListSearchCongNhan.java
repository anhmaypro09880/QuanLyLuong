package entity;

public class ListSearchCongNhan {
		private String maNV;
		private String tenNV;

		public ListSearchCongNhan() {
			// TODO Auto-generated constructor stub
		}
		public ListSearchCongNhan(String maNV, String tenNV) {
			super();
			this.maNV = maNV;
			this.tenNV = tenNV;
	
		}
		public String getMaNV() {
			return maNV;
		}
		public void setMaNV(String maNV) {
			this.maNV = maNV;
		}
		public String getTenNV() {
			return tenNV;
		}
		public void setTenNV(String tenNV) {
			this.tenNV = tenNV;
		}
		@Override
		public String toString() {
//			return "ListSearchCongNhan [maNV=" + maNV + ", tenNV=" + tenNV + ", tenSP=" + tenNV + ", tenCongDoan="
//					+ tenCongDoan + "]";
			return  maNV   +"   |   "+   tenNV;
		}
		
		
		
}
