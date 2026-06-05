package pers;
public class Personne 
{

    int id;
    String nom;

    // Constructeur par défaut
    public Personne() {
    }

    // Constructeur avec paramètres
    public Personne(int isa, String anarana) {
        this.id = isa;
        this.nom = anarana;
    }

    // Getters
    public int getId()
     {
        return this.id;
    }

    public String getNom() {
        return this.nom;
    }

    // Setters
    public int setId(int isa) {
        return this.id = isa;
    }

    public String setNom(String anarana) {
        return this.nom = anarana;
    }
}