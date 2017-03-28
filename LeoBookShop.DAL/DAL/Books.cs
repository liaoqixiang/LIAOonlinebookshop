using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using LeoBookShop.Model;
using LeoBookShop.Utility;

namespace LeoBookShop.DAL
{
    public partial class BooksService
    {
        #region InSert +int Insert(Books model)
        /// <summary>
        /// InSert into SQL Server
        /// </summary>
        /// <param name="model">the model you are about to insert</param>
        /// <returns>get the id of inserted model</returns>
        public int Insert(Books model)
        {
            #region SQL
            const string sql = @"
INSERT INTO [dbo].[Books] (
	[Title]
	,[Author]
	,[PublisherId]
	,[PublishDate]
	,[ISBN]
	,[WordsCount]
	,[UnitPrice]
	,[ContentDescription]
	,[AurhorDescription]
	,[EditorComment]
	,[TOC]
	,[CategoryId]
	,[Clicks]
)
VALUES (
	@Title
	,@Author
	,@PublisherId
	,@PublishDate
	,@ISBN
	,@WordsCount
	,@UnitPrice
	,@ContentDescription
	,@AurhorDescription
	,@EditorComment
	,@TOC
	,@CategoryId
	,@Clicks
);select @@IDENTITY";
            #endregion
            var res = SqlHelper.ExecuteScalar(sql,
                    new SqlParameter("@Title", model.Title),
                    new SqlParameter("@Author", model.Author),
                    new SqlParameter("@PublishDate", model.PublishDate),
                    new SqlParameter("@ISBN", model.ISBN),
                    new SqlParameter("@UnitPrice", model.UnitPrice),
                    new SqlParameter("@CategoryId", model.CategoryId)

                );
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion

        #region Delete a record +int Delete(int id)
        public int Delete(int id)
        {
            const string sql = "DELETE FROM [dbo].[Books] WHERE [Id] = @Id";
            return SqlHelper.ExecuteNonQuery(sql, new SqlParameter("@Id", id));
        }
        #endregion

        #region Using modified model to update +int Update(Books model)
        /// <summary>
        /// Using modified model to update
        /// </summary>
        /// <param name="model">entity</param>
        /// <returns>return how many rows have effected</returns>
        public int Update(Books model)
        {
            #region SQL
            const string sql = @"
UPDATE [dbo].[Books]
SET 
	[Title] = @Title
	,[Author] = @Author
	,[PublisherId] = @PublisherId
	,[PublishDate] = @PublishDate
	,[ISBN] = @ISBN
	,[WordsCount] = @WordsCount
	,[UnitPrice] = @UnitPrice
	,[ContentDescription] = @ContentDescription
	,[AurhorDescription] = @AurhorDescription
	,[EditorComment] = @EditorComment
	,[TOC] = @TOC
	,[CategoryId] = @CategoryId
	,[Clicks] = @Clicks
WHERE [Id] = @Id";
            #endregion
            return SqlHelper.ExecuteNonQuery(sql,
                    new SqlParameter("@Id", model.Id),
                    new SqlParameter("@Title", model.Title),
                    new SqlParameter("@Author", model.Author),
                    new SqlParameter("@PublishDate", model.PublishDate),
                    new SqlParameter("@ISBN", model.ISBN),
                    new SqlParameter("@UnitPrice", model.UnitPrice),
                    new SqlParameter("@CategoryId", model.CategoryId)
                );
        }
        #endregion

        #region Pagination +IEnumerable<Books> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        /// <summary>
        /// Paginating the list
        /// </summary>
        /// <param name="index">index</param>
        /// <param name="size">Size of the list</param>
        /// <param name="wheres">anonymous class to pass the where conditions</param>
        /// <param name="orderField">using which column name to order</param>
        /// <param name="isDesc">ascending or descending</param>
        /// <returns>a model list</returns>
        public IEnumerable<Books> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        {
            var parameters = new List<SqlParameter>();
            var whereBuilder = new System.Text.StringBuilder();
            if (wheres != null)
            {
                var props = wheres.GetType().GetProperties();
                foreach (var prop in props)
                {
                    if (prop.Name.Equals("__o", StringComparison.InvariantCultureIgnoreCase))//if pass a string like "and" or "or" which is part of your sql query
                    {
                        //pass to sqlhelper to process it
                        whereBuilder.AppendFormat(" {0} ", prop.GetValue(wheres, null).ToString());
                    }
                    else
                    {
                        var val = prop.GetValue(wheres, null).ToString();
                        //pass to sqlhelper to process it
                        whereBuilder.AppendFormat(" [{0}] = @{0} ", prop.Name);
                        parameters.Add(new SqlParameter("@" + prop.Name, val));
                    }
                }
            }
            var sql = SqlHelper.GenerateQuerySql("Books", new[] { "Id", "Title", "Author", "PublishDate", "ISBN", "UnitPrice", "CategoryId" }, index, size, whereBuilder.ToString(), orderField, isDesc);
            using (var reader = SqlHelper.ExecuteReader(sql, parameters.ToArray()))
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        yield return SqlHelper.MapEntity<Books>(reader);
                    }
                }
            }
        }
        #endregion

        #region get single entity +Books QuerySingle(object wheres)
        /// <summary>
        /// get single entity
        /// </summary>
        /// <param name="wheres">anonymous class(same functionality as above)</param>
        /// <returns>model</returns>
        public Books QuerySingle(object wheres)
        {
            var list = QueryList(1, 1, wheres, null);
            return list != null && list.Any() ? list.FirstOrDefault() : null;
        }
        #endregion

        #region Using id to get single entity +Books QuerySingle(int id)
        /// <summary>
        /// Using id to get single entity
        /// </summary>
        /// <param name="id">ID</param>
        /// <returns>Model</returns>
        public Books QuerySingle(int id)
        {
            const string sql = "SELECT TOP 1 [Id], [Title], [Author], [PublishDate], [ISBN], [UnitPrice], [CategoryId] FROM [dbo].[Books] WHERE [Id] = @Id";
            using (var reader = SqlHelper.ExecuteReader(sql, new SqlParameter("@Id", id)))
            {
                if (reader.HasRows)
                {
                    reader.Read();
                    return SqlHelper.MapEntity<Books>(reader);
                }
                else
                {
                    return null;
                }
            }
        }
        #endregion

        #region Number of Results +int QueryCount(object wheres)
        /// <summary>
        /// Number of Results
        /// </summary>
        /// <param name="wheres">anonymous class</param>
        /// <returns>model</returns>
        public int QueryCount(object wheres)
        {
            var parameters = new List<SqlParameter>();
            var whereBuilder = new System.Text.StringBuilder();
            if (wheres != null)
            {
                //Using Reflection
                var props = wheres.GetType().GetProperties();
                foreach (var prop in props)
                {
                    if (prop.Name.Equals("__o", StringComparison.InvariantCultureIgnoreCase))
                    {
                        //pass to sqlhelper to process it
                        whereBuilder.AppendFormat(" {0} ", prop.GetValue(wheres, null).ToString());
                    }
                    else
                    {
                        var val = prop.GetValue(wheres, null).ToString();
                        //pass to sqlhelper to process it
                        whereBuilder.AppendFormat(" [{0}] = @{0} ", prop.Name);
                        parameters.Add(new SqlParameter("@" + prop.Name, val));
                    }
                }
            }
            var sql = SqlHelper.GenerateQuerySql("Books", new[] { "COUNT(1)" }, whereBuilder.ToString(), string.Empty);
            var res = SqlHelper.ExecuteScalar(sql, parameters.ToArray());
            return res == null ? 0 : Convert.ToInt32(res);
        }
        #endregion
    }
}