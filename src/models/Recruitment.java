package models;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "recruitments")
@NamedQueries({
    @NamedQuery(
            name = "getAllRecruitments",
            query = "SELECT r FROM Recruitment AS r ORDER BY r.id DESC"
            ),
    @NamedQuery(
            name = "getRecruitmentsCount",
            query = "SELECT COUNT(r) FROM Recruitment AS r"
            ),
    @NamedQuery(
            name = "getMyRecruitments",
            query = "SELECT r FROM Recruitment AS r WHERE r.user = :login_user ORDER BY r.id DESC"
            ),
    @NamedQuery(
            name = "getMyRecruitmentsCount",
            query = "SELECT COUNT(r) FROM Recruitment AS r WHERE r.user = :login_user"
            ),

})
@Entity
public class Recruitment {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "user_id",nullable = false)
    private User user;

    @Lob
    @Column(name = "contents",nullable = false)
    private String contents;

    @Column(name = "created_at",nullable = false)
    private Timestamp created_at;

    @Column(name = "updated_at",nullable = false)
    private Timestamp updated_at;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }
}
