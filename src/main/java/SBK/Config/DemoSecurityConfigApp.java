package SBK.Config;

import java.beans.PropertyVetoException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableWebSecurity
@ComponentScan(basePackages="SBK")
@PropertySource("classpath:persistence-mysql.properties")
public class DemoSecurityConfigApp extends WebSecurityConfigurerAdapter{

	
	// set up variable to hold the properties
	
	@Autowired
	private Environment env;
	@Autowired
	private DataSource securityDataSource;
	@Override
	protected void configure(AuthenticationManagerBuilder auth) 
			throws Exception {
		// add our users for in memory authentication
		System.out.println("in security method");
//UserBuilder users = User.withDefaultPasswordEncoder();
//		
//auth.inMemoryAuthentication()
//	.withUser(users.username("chirag").password("test123")
//			.roles("EMPLOYEE"))
//	.withUser(users.username("kanu").password("test123")
//			.roles("EMPLOYEE","MANAGER"))
//	.withUser(users.username("SBK").password("test123")
//			.roles("EMPLOYEE","ADMIN"));
		auth.jdbcAuthentication().dataSource(securityDataSource);
		
		
		}
//	@Override
//	public void configure(WebSecurity web){
//		web.ignoring().antMatchers("/resources/**");
//	}
	@Override
	public void configure(WebSecurity web){
		web
		   .ignoring()
		   .antMatchers("SpringSecurity/resources/**");
	}
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// We are disabling CSRF so that our forms don't complain for a CSRF token.
        // Beware that it can create a security vulnerability

        // We are permitting all static resources to be accessed publicly
		http
			
		.authorizeRequests()
		.antMatchers("/resources/**").permitAll()
            // We are restricting endpoints for individual roles.
            // Only users with allowed roles will be able to access individual endpoints.
		.and()
		.authorizeRequests()
			.antMatchers("/").permitAll()
			.antMatchers("/login/**").permitAll()
			.antMatchers("/signup/**").permitAll()
			.antMatchers("/otp").permitAll()
			.antMatchers("/AllCanAccess/**").permitAll()
			.antMatchers("/payment").hasAnyRole("USER")
			.antMatchers("/paymentUpdate").hasAnyRole("USER")
			.antMatchers("/cart").hasAnyRole("USER")
			.antMatchers("/addToCart").hasAnyRole("USER")
			.antMatchers("/Protected/**").hasAnyRole("USER","ADMIN")
			.antMatchers("/Granted/**").hasAnyRole("ADMIN")
                // Following line denotes that all requests must be authenticated.
                // Hence, once a request comes to our application, we will check if the user is authenticated or not.
			.anyRequest().authenticated()

                // Here we are configuring our login form
		.and()
		.formLogin()
		.loginPage("/login")
		.loginProcessingUrl("/authenticateTheUser")
		.permitAll()
		.and()
		.logout()
		.permitAll()
		.and()
		.exceptionHandling()
		.accessDeniedPage("/accessdenie");	
		}
	
	@Bean
	public DataSource securityDataSource() {

	ComboPooledDataSource dataSource = new ComboPooledDataSource();

	try {
		System.out.println(env.getProperty("jdbc.driver"));

	dataSource.setDriverClass(env.getProperty("jdbc.driver"));

	} catch (PropertyVetoException e) {

	// TODO Auto-generated catch block

	e.printStackTrace();

	};

	
	System.out.println(env.getProperty("jdbc.url"));
	dataSource.setJdbcUrl(env.getProperty("jdbc.url"));

	dataSource.setUser(env.getProperty("jdbc.userName"));

	dataSource.setPassword(env.getProperty("jdbc.password"));



	dataSource.setInitialPoolSize(getIntProperty("connection.pool.initialPoolSize"));
	 
	dataSource.setMinPoolSize(getIntProperty("connection.pool.minPoolSize"));
	 
	dataSource.setMaxPoolSize(getIntProperty("connection.pool.maxPoolSize"));
	 
	dataSource.setMaxIdleTime(getIntProperty("connection.pool.maxIdleTime"));


	return dataSource;

	}


	// need a helper method 
	// read environment property and convert to int
	
	private int getIntProperty(String propName) {
		
		String propVal = env.getProperty(propName);
		
		// now convert to int
		int intPropVal = Integer.parseInt(propVal);
		System.out.println();
		return intPropVal;
	}
}