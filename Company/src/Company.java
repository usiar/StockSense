import java.util.Date;

public class Company {
    private static int company_id;
    private String company_name;
    private Date company_creation_date;

    public Company(String company_name) {
        company_id ++;
        this.company_name = company_name;
        company_creation_date = new Date();
    }
}
