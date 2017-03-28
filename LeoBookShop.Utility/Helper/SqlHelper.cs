using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Sockets;

namespace LeoBookShop.Utility
{
    /// <summary>
    /// SQL Server Helper
    /// static class
    /// Copyright LEO
    /// </summary>
    public static partial class SqlHelper
    {
        /// <summary>
        /// connection string
        /// </summary>
        private readonly static string connStr;
        static SqlHelper()
        {
            var conn = System.Configuration.ConfigurationManager.ConnectionStrings["connStr"];
            if (conn != null)
            {
                connStr = conn.ConnectionString;
            }
        }



        #region Public Method



        #region Query statememt

        #region pagination Query +static string GenerateQuerySql(string table, string[] columns, int index, int size, string wheres, string orderField, bool isDesc = true)
        /// <summary>
        /// Return T-SQL
        /// </summary>
        /// <param name="table">table name</param>
        /// <param name="columns">column array(colum1,colum2...)</param>
        /// <param name="index">current index(if index smaller than 1, then return all results)</param>
        /// <param name="size">how many pages i want</param>
        /// <param name="where">conditional statement(ignore it if you dont want to do anything to where(input: null))</param>
        /// <param name="orderField">Order statement, ignore it using => null)</param>
        /// <param name="isDesc">Ascending or Descending(0:desc|1:asc)(ignore it using => -1)</param>
        /// <returns>return T-SQL</returns>
        public static string GenerateQuerySql(string table, string[] columns, int index, int size, string where, string orderField, bool isDesc = true)
        {
            if (index == 1)
            {
                // SQL for First page
                return GenerateQuerySql(table, columns, size, where, orderField, isDesc);
            }
            if (index < 1)
            {
                // retrieve all data
                return GenerateQuerySql(table, columns, where, orderField, isDesc);
            }
            if (string.IsNullOrEmpty(orderField))
            {
                throw new ArgumentNullException("orderField");
            }
            // use row_number to get paginated page
            // SQL Template
            const string format = @"select {0} from
                                    (
                                        select ROW_NUMBER() over(order by [{1}] {2}) as num, {0} from [{3}] {4}
                                    )
                                    as tbl
                                    where
                                        tbl.num between ({5}-1)*{6} + 1 and {5}*{6};";
            // where statement 
            where = string.IsNullOrEmpty(where) ? string.Empty : "where " + where;
            // join all together
            string column = columns != null && columns.Any() ? string.Join(" , ", columns) : "*";
            return string.Format(format, column, orderField, isDesc ? "desc" : string.Empty, table, where, index, size);
        }
        #endregion
      
        #region Query for all data +static string GenerateQuerySql(string table, string[] columns, string wheres, string orderField, bool isDesc = true)
        /// <summary>
        /// Return T-SQL
        /// </summary>
        /// <param name="table">table name</param>
        /// <param name="columns">column array(colum1,colum2...)</param>
        /// <param name="where">conditional statement(ignore it if you dont want to do anything to where(input: null))</param>
        /// <param name="orderField">Order statement, ignore it using => null)</param>
        /// <param name="isDesc">Ascending or Descending(0:desc|1:asc)(ignore it using => -1)</param>
        /// <returns>return T-SQL</returns>
        public static string GenerateQuerySql(string table, string[] columns, string where, string orderField, bool isDesc = true)
        {
            // consist of where statement
            where = string.IsNullOrEmpty(where) ? string.Empty : "where " + where;
            // Join name of columns together
            string column = columns != null && columns.Any() ? string.Join(" , ", columns) : "*";
            const string format = "select {0} from [{1}] {2} {3} {4}";
            return string.Format(format, column, table, where,
                string.IsNullOrEmpty(orderField) ? string.Empty : "order by " + orderField,
                isDesc && !string.IsNullOrEmpty(orderField) ? "desc" : string.Empty);
        }
        #endregion

        #region Paginated Query for first page +static string GenerateQuerySql(string table, string[] columns, int size, string where, string orderField, bool isDesc = true)
        /// <summary>
        /// Paginated Query for first page Return T-SQL
        /// </summary>
        /// <param name="table">table name</param>
        /// <param name="columns">column array(colum1,colum2...)</param>
        /// <param name="size">how many pages i want</param>
        /// <param name="where">conditional statement(ignore it if you dont want to do anything to where(input: null))</param>
        /// <param name="orderField">Order statement, ignore it using => null)</param>
        /// <param name="isDesc">Ascending or Descending(0:desc|1:asc)(ignore it using => -1)</param>

        /// <returns>return T-SQL</returns>
        public static string GenerateQuerySql(string table, string[] columns, int size, string where, string orderField, bool isDesc = true)
        {
            // consist of where statement
            where = string.IsNullOrEmpty(where) ? string.Empty : "where " + where;
            // Join name of columns together
            string column = columns != null && columns.Any() ? string.Join(" , ", columns) : "*";
            const string format = "select top {0} {1} from [{2}] {3} {4} {5}";
            return string.Format(format, size, column, table, where,
                  string.IsNullOrEmpty(orderField) ? string.Empty : "order by " + orderField,
                  isDesc && !string.IsNullOrEmpty(orderField) ? "desc" : string.Empty);
        }
        #endregion
        #endregion

        #region make SqlDataReader Object to a real entity +static TEntity MapEntity<TEntity>(SqlDataReader reader) where TEntity : class,new()
        /// <summary>
        /// make SqlDataReader Object to a real entity
        /// </summary>
        /// <typeparam name="TEntity">entity</typeparam>
        /// <param name="reader">sqldatareader object</param>
        /// <returns>entity</returns>
        public static TEntity MapEntity<TEntity>(SqlDataReader reader) where TEntity : class, new()
        {
            try
            {
                var props = typeof(TEntity).GetProperties();
                var entity = new TEntity();
                foreach (var prop in props)
                {
                    if (prop.CanWrite)
                    {
                        try
                        {
                            var index = reader.GetOrdinal(prop.Name);
                            var data = reader.GetValue(index);
                            if (data != DBNull.Value)
                            {
                                prop.SetValue(entity, Convert.ChangeType(data, prop.PropertyType), null);
                            }
                        }
                        catch (IndexOutOfRangeException)
                        {
                            continue;
                        }
                    }
                }
                return entity;
            }
            catch
            {
                return null;
            }
        }
        #endregion

        #endregion

        #region SQL Excecution

        #region ExecuteNonQuery +static int ExecuteNonQuery(string cmdText, params SqlParameter[] parameters)
        /// <summary>
        /// return affected rows
        /// </summary>
        /// <param name="cmdText">query</param>
        /// <param name="parameters">prameter</param>
        /// <exception cref="excetion"></exception>
        /// <returns>return affected rows</returns>
        public static int ExecuteNonQuery(string cmdText, params SqlParameter[] parameters)
        {
            return ExecuteNonQuery(cmdText, CommandType.Text, parameters);
        }
        #endregion
        #region ExecuteNonQuery +static int ExecuteNonQuery(string cmdText, CommandType type, params SqlParameter[] parameters)
        /// <summary>
        /// return affected rows
        /// </summary>
        /// <param name="cmdText">query</param>
        /// <param name="type">type of command(normally is text)</param>
        /// <param name="parameters">prameter</param>
        /// <exception cref="excetion"></exception>
        /// <returns>return affected rows</returns>
        public static int ExecuteNonQuery(string cmdText, CommandType type, params SqlParameter[] parameters)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand(cmdText, conn))
                {
                    if (parameters != null)
                    {
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddRange(parameters);
                    }
                    cmd.CommandType = type;
                    try
                    {
                        conn.Open();
                        int res = cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                        return res;
                    }
                    catch (System.Data.SqlClient.SqlException e)
                    {
                        conn.Close();
                        throw e;
                    }
                }
            }
        }
        #endregion

        #region ExecuteScalar +static object ExecuteScalar(string cmdText, params SqlParameter[] parameters)
        /// <summary>
        /// return data of first row
        /// </summary>
        /// <param name="cmdText">query</param>
        /// <param name="parameters">prameter</param>
        /// <exception cref="excetion"></exception>
        /// <returns>return data of first row</returns>
        public static object ExecuteScalar(string cmdText, params SqlParameter[] parameters)
        {
            return ExecuteScalar(cmdText, CommandType.Text, parameters);
        }
        #endregion
        #region ExecuteScalar +static object ExecuteScalar(string cmdText, CommandType type, params SqlParameter[] parameters)
        /// <summary>
        /// return data of first row
        /// </summary>
        /// <param name="cmdText">query</param>
        /// <param name="type">type of command(normally is text)</param>
        /// <param name="parameters">prameter</param>
        /// <exception cref="excetion"></exception>
        /// <returns>return data of first row</returns>
        public static object ExecuteScalar(string cmdText, CommandType type, params SqlParameter[] parameters)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand(cmdText, conn))
                {
                    if (parameters != null)
                    {
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddRange(parameters);
                    }
                    cmd.CommandType = type;
                    try
                    {
                        conn.Open();
                        object res = cmd.ExecuteScalar();
                        cmd.Parameters.Clear();
                        return res;
                    }
                    catch (System.Data.SqlClient.SqlException e)
                    {
                        conn.Close();
                        throw e;
                    }
                }
            }
        }
        #endregion

        #region ExecuteReader +static SqlDataReader ExecuteReader(string cmdText, params SqlParameter[] parameters)
        /// <summary>
        /// execute a query return sqldatareader, if sql goes wrong, it will close and throw exception.
        /// </summary>
        /// <param name="cmdText">sql command</param>
        /// <param name="parameters">parameters</param>
        /// <exception cref="exception"></exception>
        /// <returns>SqlDataReader object</returns>
        public static SqlDataReader ExecuteReader(string cmdText, params SqlParameter[] parameters)
        {
            return ExecuteReader(cmdText, CommandType.Text, parameters);
        }
        #endregion
        #region ExecuteReader +static SqlDataReader ExecuteReader(string cmdText, CommandType type, params SqlParameter[] parameters)
        /// <summary>
        /// execute a query return sqldatareader, if sql goes wrong, it will close and throw exception.
        /// </summary>
        /// <param name="cmdText">sql command</param>
        /// <param name="type">commandtype</param>
        /// <param name="parameters">parameters</param>
        /// <exception cref="exception"></exception>
        /// <returns>SqlDataReader object</returns>
        public static SqlDataReader ExecuteReader(string cmdText, CommandType type, params SqlParameter[] parameters)
        {
            SqlConnection conn = new SqlConnection(connStr);
            using (SqlCommand cmd = new SqlCommand(cmdText, conn))
            {
                if (parameters != null)
                {
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddRange(parameters);
                }
                cmd.CommandType = type;
                conn.Open();
                try
                {
                    SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    cmd.Parameters.Clear();
                    return reader;
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    //exception occurs, close it mannually.
                    conn.Close();
                    throw ex;
                }
            }
        }
        #endregion

        #region ExecuteDataSet +static DataSet ExecuteDataSet(string cmdText, params SqlParameter[] parameters)
        /// <summary>
        /// return Dataset
        /// </summary>
        /// <param name="cmdText">command</param>
        /// <param name="parameters">parameters</param>
        /// <returns>DataSet</returns>
        public static DataSet ExecuteDataSet(string cmdText, params SqlParameter[] parameters)
        {
            return ExecuteDataSet(cmdText, CommandType.Text, parameters);
        }
        #endregion
        #region ExecuteDataSet +static DataSet ExecuteDataSet(string cmdText, CommandType type, params SqlParameter[] parameters)
        /// <summary>
        /// return Dataset
        /// </summary>
        /// <param name="cmdText">command</param>
        /// <param name="type">commandtype</param>
        /// <param name="parameters">parameters</param>
        /// <returns>DataSet</returns>
        public static DataSet ExecuteDataSet(string cmdText, CommandType type, params SqlParameter[] parameters)
        {
            using (SqlDataAdapter adapter = new SqlDataAdapter(cmdText, connStr))
            {
                using (DataSet ds = new DataSet())
                {
                    if (parameters != null)
                    {
                        adapter.SelectCommand.Parameters.Clear();
                        adapter.SelectCommand.Parameters.AddRange(parameters);
                    }
                    adapter.SelectCommand.CommandType = type;
                    adapter.Fill(ds);
                    adapter.SelectCommand.Parameters.Clear();
                    return ds;
                }
            }
        }
        #endregion

        #region ExecuteDataTable +static DataTable ExecuteDataTable(string cmdText, params SqlParameter[] parameters)
        /// <summary>
        /// return datatable
        /// </summary>
        /// <param name="cmdText">command</param>
        /// <param name="parameters">parameters</param>
        /// <returns>datatable</returns>
        public static DataTable ExecuteDataTable(string cmdText, params SqlParameter[] parameters)
        {
            return ExecuteDataTable(cmdText, CommandType.Text, parameters);
        }
        #endregion
        #region ExecuteDataTable +static DataTable ExecuteDataTable(string cmdText, CommandType type, params SqlParameter[] parameters)
        /// <summary>
        /// return datatable
        /// </summary>
        /// <param name="cmdText">command</param>
        /// <param name="type">commandtype</param>
        /// <param name="parameters">parameters</param>
        /// <returns>datatable</returns>
        public static DataTable ExecuteDataTable(string cmdText, CommandType type, params SqlParameter[] parameters)
        {
            return ExecuteDataSet(cmdText, type, parameters).Tables[0];
        }
        #endregion
        #endregion
    }
}
