package PayrollApplication;

import PayrollFactory.PayrollFactory;
import PayrollImplementation.PayrollFactoryImplementation;
import TextParserTransactionSource.TextParserTransactionSource;
import TransactionApplication.TransactionApplication;
import TransactionApplication.TransactionSource;
import TransactionFactory.TransactionFactory;
import TransactionImplementation.TransactionFactoryImplementation;

public class PayrollApplication extends TransactionApplication {
	private TransactionSource transactionSource;

	public PayrollApplication() {
		PayrollFactory payrollFactory = new PayrollFactoryImplementation();
		TransactionFactory transactionFactory = new TransactionFactoryImplementation(payrollFactory);
		transactionSource = new TextParserTransactionSource(transactionFactory);
	}

	public void SetSource(String source) {
		transactionSource.SetSource(source);
		transactionSource.Execute();
	}
}
