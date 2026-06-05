package pers;
public class Utilisateur 
{

    int id;
    double personne;
    double methode;
    double mode;
    double dure;
    double vola_pret;
    double taux; 

    // Constructeur par défaut
    public Utilisateur() {
    }

    // Constructeur avec paramètres
    public Utilisateur(int isa, double personne,double meth,double mode,double periode,double vola,double taux) 
    {
        this.id = isa;
        this.personne = personne;
        this.methode=meth;
        this.mode=mode;
        this.dure=periode;
        this.vola_pret=vola;
        this.taux=taux;
    }

    // Getters
    public int getId()
    {
        return this.id;
    }

    public double getPers() {
        return this.personne;
    }

    public double getMethode()
    {
        return this.methode;
    }

    public double getMode() 
    {
        return this.mode;
    }

    public double getDure() 
    {
        return this.dure;
    }

    public double getVola() 
    {
        return this.vola_pret;
    }
    
    public double getTaux()
    {
        return this.taux;
    }



    // Setters
    public int setId(int id)
    {
        return this.id=id;
    }

    public double setPers(double pers) {
        return this.personne=pers;
    }

    public double setMethode(double meth)
    {
        return this.methode=meth;
    }

    public double setMode(double mo) 
    {
        return this.mode=mo;
    }

    public double setDure(double d) 
    {
        return this.dure=d;
    }

    public double setVola(double capital)
    {
        return this.vola_pret=capital;
    }

    public double setTaux(double t)
    {
        return this.taux=t;
    }
}