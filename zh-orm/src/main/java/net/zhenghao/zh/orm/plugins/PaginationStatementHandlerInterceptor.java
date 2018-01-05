package net.zhenghao.zh.orm.plugins;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.DefaultReflectorFactory;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.ReflectorFactory;
import org.apache.ibatis.reflection.factory.DefaultObjectFactory;
import org.apache.ibatis.reflection.factory.ObjectFactory;
import org.apache.ibatis.reflection.wrapper.DefaultObjectWrapperFactory;
import org.apache.ibatis.reflection.wrapper.ObjectWrapperFactory;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.zhenghao.zh.common.entity.Page;
import net.zhenghao.zh.orm.dialect.Dialect;
import net.zhenghao.zh.orm.dialect.DialectFactory;

/**
 * mybatis分页插件
 * 这里是拦截每一条查询条件，如果查询条件里面有page类参数，则判定为需要分页的SQL
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2017年12月6日 上午9:43:28
 * PaginationStatementHandlerInterceptor.java
 */
@Intercepts({ @Signature(type = StatementHandler.class, method = "prepare", args = { Connection.class, Integer.class }) })
public class PaginationStatementHandlerInterceptor implements Interceptor {

	private final static Logger logger = LoggerFactory.getLogger(PaginationStatementHandlerInterceptor.class);

    private static final ObjectFactory DEFAULT_OBJECT_FACTORY = new DefaultObjectFactory();
    private static final ObjectWrapperFactory DEFAULT_OBJECT_WRAPPER_FACTORY = new DefaultObjectWrapperFactory();
    private static final ReflectorFactory DEFAULT_REFLECTOR_FACTORY = new DefaultReflectorFactory();
    
	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		// TODO Auto-generated method stub
		StatementHandler statementHandler = (StatementHandler) invocation.getTarget();
        ParameterHandler parameterHandler = statementHandler.getParameterHandler();
        BoundSql boundSql = statementHandler.getBoundSql();
        
        MetaObject metaStatementHandler = MetaObject.forObject(statementHandler, DEFAULT_OBJECT_FACTORY, DEFAULT_OBJECT_WRAPPER_FACTORY, DEFAULT_REFLECTOR_FACTORY);
        RowBounds rowBounds = (RowBounds) metaStatementHandler.getValue("delegate.rowBounds");
        // 没有分页参数
        if (rowBounds == null || rowBounds == RowBounds.DEFAULT) {
            return invocation.proceed();
        }
        
        Configuration configuration = (Configuration) metaStatementHandler.getValue("delegate.configuration");
        Dialect dialect = DialectFactory.buildDialect(configuration);
        //得到sql语句
        String originalSql = (String) metaStatementHandler.getValue("delegate.boundSql.sql");
        
        //获取总记录数
        Page<?> page = (Page<?>) rowBounds;
        String countSql = dialect.getCountString(originalSql);
        Connection connection = (Connection) invocation.getArgs()[0];
        int total = getTotal(parameterHandler, connection, countSql);
        page.setTotal(total);
        
        // 设置物理分页语句
        metaStatementHandler.setValue("delegate.boundSql.sql", dialect.getLimitString(originalSql, page.getOffset(), page.getLimit()));
        // 屏蔽mybatis原有分页
        metaStatementHandler.setValue("delegate.rowBounds.offset", RowBounds.NO_ROW_OFFSET);
        metaStatementHandler.setValue("delegate.rowBounds.limit", RowBounds.NO_ROW_LIMIT);
        if (logger.isDebugEnabled()) {
            logger.debug("分页SQL : " + boundSql.getSql());
        }
        return invocation.proceed();
	}
	@Override
	public Object plugin(Object target) {
		// TODO Auto-generated method stub
		return Plugin.wrap(target, this);
	}
	@Override
	public void setProperties(Properties properties) {
		// TODO Auto-generated method stub
		
	}
	
	/**
	 * 获取总记录
	 * @param parameterHandler
	 * @param connection
	 * @param countSql
	 * @return
	 * @throws SQLException
	 */
	private int getTotal(ParameterHandler parameterHandler, Connection connection, String countSql) throws SQLException {
		//自己建数据库链接查询这条查询条数的sql语句
		PreparedStatement prepareStatement = connection.prepareStatement(countSql);
		parameterHandler.setParameters(prepareStatement);
	    ResultSet rs = prepareStatement.executeQuery();
	    int count = 0;
        if (rs.next()) {
            count = rs.getInt(1);
        }
        rs.close();
        prepareStatement.close();
        return count;
	}
}
