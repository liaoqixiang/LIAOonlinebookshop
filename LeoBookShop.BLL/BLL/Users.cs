using System.Collections.Generic;
using System.Linq;
using LeoBookShop.DAL;
using LeoBookShop.Model;

namespace LeoBookShop.BLL 
{
	public partial class UsersManager
	{
   		     
		/// <summary>
        /// object of database
        /// </summary>
        private UsersService _dao = new UsersService();

        #region InSert +int Insert(Users model)
        /// <summary>
        /// InSert into SQL Server
        /// </summary>
        /// <param name="model">the model you are about to insert</param>
        /// <returns>get the id of inserted model</returns>
        public int Insert(Users model)
        {
            return _dao.Insert(model);
        }
        #endregion

        #region Delete a record +int Delete(int id)
        public int Delete(int id)
        {
            return _dao.Delete(id);
        }
        #endregion

        #region Using modified model to update +int Update(Users model)
        /// <summary>
        /// Using modified model to update
        /// </summary>
        /// <param name="model">entity</param>
        /// <returns>return how many rows have effected</returns>
        public int Update(Users model)
        {
            return _dao.Update(model);
        }
        #endregion

        #region Pagination +IEnumerable<Users> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        /// <summary>
        /// Paginating the list
        /// </summary>
        /// <param name="index">index</param>
        /// <param name="size">Size of the list</param>
        /// <param name="wheres">anonymous class to pass the where conditions</param>
        /// <param name="orderField">using which column name to order</param>
        /// <param name="isDesc">ascending or descending</param>
        /// <returns>a model list</returns>
        public IEnumerable<Users> QueryList(int index, int size, object wheres, string orderField, bool isDesc = true)
        {
            return _dao.QueryList(index, size, wheres, orderField, isDesc);
        }
        #endregion

        #region get single entity +Users QuerySingle(object wheres)
        /// <summary>
        /// get single entity
        /// </summary>
        /// <param name="wheres">anonymous class(same functionality as above)</param>
        /// <returns>model</returns>
        public Users QuerySingle(object wheres)
        {
            return _dao.QuerySingle(wheres);
        }
        #endregion
        
        #region Using id to get single entity +Users QuerySingle(int id)
         /// <summary>
        /// Using id to get single entity
        /// </summary>
        /// <param name="id">ID</param>
        /// <returns>Model</returns>
        public Users QuerySingle(int id)
        {
            return _dao.QuerySingle(id);
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
            return _dao.QueryCount(wheres);
        }
        #endregion

        //use enum loginstate to check user state.
        public Loginstate ValidateUser(string username, string userpwd, out string msg, out Model.Users user)
        {
            user = _dao.QuerySingle(new { LoginId = username });
            if (user != null)
            {

                if (user.LoginPwd == userpwd)
                {
                    msg = "login successful";
                    return Loginstate.LoginState_success;
                }
                else
                {
                    msg = "wrong password";
                    return Loginstate.UserPassWord_wrong;
                }
            }
            else
            {
                msg = "Login Failed";
                return Loginstate.Username_not_exists;
            }

        }
    }
}