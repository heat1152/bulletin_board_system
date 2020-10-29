package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "users")
@NamedQueries({
    @NamedQuery(
            name = "checkLoginNameAndPassword",
            query = "SELECT u FROM User AS u WHERE u.name = :name AND u.password = :pass"
            ),
    @NamedQuery(
            name = "getAllUser",
            query = "SELECT u FROM User AS u ORDER BY u.id DESC"
            )
})
@Entity
public class User {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name",length = 20,nullable = false)
    private String name;

    @Lob
    @Column(name = "profile")
    private String profile;

    @Column(name = "password",length = 64,nullable = false)
    private String password;

    @Column(name = "profile_photo",length = 255)
    private String profile_phto;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProfile_phto() {
        return profile_phto;
    }

    public void setProfile_phto(String profile_phto) {
        this.profile_phto = profile_phto;
    }

}
