public class SalesReceipt {
	private long itsSaleDate;
	private double itsAmount;

	public SalesReceipt(long saleDate, double amount) {
		itsSaleDate = saleDate;
		itsAmount = amount;
	}

	public long GetSaleDate() {
		return itsSaleDate;
	}

	public double GetAmount() {
		return itsAmount;
	}
}
