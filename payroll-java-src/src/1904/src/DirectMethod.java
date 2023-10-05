public class DirectMethod implements PaymentMethod {
	private String itsBank;
	private String itsAccount;

	public DirectMethod(String bank, String account) {
		itsBank = bank;
		itsAccount = account;
	}

	public String GetBank() {
		return itsBank;
	}

	public String GetAccount() {
		return itsAccount;
	}
}
