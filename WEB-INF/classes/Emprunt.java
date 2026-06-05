package mindrana;
public class Emprunt
{
    int id;
    int personne;
    double periode;
    double capital;
    double interet;
    double amorti;
    double annuite;
    double valeur;

    public double getPeriode()
    {return this.periode;}
    public int getPersonne()
    {return this.personne;}
    public double getCapital()
    {return this.capital;}
    public double getInteret()
    {return this.interet;}
    public double getAmorti()
    {return this.amorti;}
    public double getAnnuite()
    {return this.annuite;}
    public double getValeur()
    {return this.valeur;}

    public double setPeriode(double id)
    {return this.periode=id;}
    public int setPersonne(int id)
    {return this.personne=id;}
    public double setCapital(double vola)
    {return this.capital=vola;}
    public double setInteret(double interet)
    {return this.interet=interet;}
    public double setAmorti(double amorti)
    {return this.amorti=amorti;}
    public double setAnnuite(double annui)
    {return this.annuite=annui;}
    public double setValeur(double val)
    {return this.valeur=val;}

    public Emprunt(double id,int pers,double cap,double inte,double amorti,double annui,double val)
    {
        this.periode=id;
        this.personne=pers;
        this.capital=cap;
        this.interet=inte;
        this.amorti=amorti;
        this.annuite=annui;
        this.valeur=val;
    }
    public Emprunt(){}
}