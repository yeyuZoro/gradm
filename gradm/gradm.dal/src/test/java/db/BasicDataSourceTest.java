package db;

import org.apache.commons.dbcp.BasicDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by feilong.li on 17/1/12.
 */
public class BasicDataSourceTest {

    //创建数据源
    private static DataSource setupDataSource(String connectURI) {
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName("com.mysql.jdbc.Driver");
        ds.setUsername("yun_rw_all");
        ds.setPassword("st4Ukp6Bs");
        ds.setUrl(connectURI);

        return ds;
    }

/*    //关闭数据源
    public static void shutdownDataSource(DataSource ds) throws SQLException {
        BasicDataSource bds = (BasicDataSource) ds;
        bds.close();
    }*/


    public static void main(String[] args) {
        //创建BasicDataSource
        DataSource dataSource = setupDataSource("jdbc:mysql://121.40.87.101:3306/legend");

        //创建JDBC对象
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();
            st = conn.createStatement();
            String sql = "select id,category_name from legend_tq_check_category";
            rs = st.executeQuery(sql);

            System.out.println("Results:");
            int numcols = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                for (int i=1; i<=numcols; i++) {
                    System.out.println(rs.getString(i));
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                st.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
    }

}

