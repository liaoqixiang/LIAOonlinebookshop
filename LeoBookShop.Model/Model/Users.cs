using System; 
namespace LeoBookShop.Model
{
	public class Users
	{
   		     
      	/// <summary>
		/// Id
        /// </summary>
        public int Id { get; set; }
		/// <summary>
		/// LoginId
        /// </summary>
        public string LoginId { get; set; }
		/// <summary>
		/// LoginPwd
        /// </summary>
        public string LoginPwd { get; set; }
		/// <summary>
		/// Name
        /// </summary>
        public string Name { get; set; }
		/// <summary>
		/// Address
        /// </summary>
        public string Address { get; set; }
		/// <summary>
		/// Phone
        /// </summary>
        public string Phone { get; set; }
		/// <summary>
		/// Mail
        /// </summary>
        public string Mail { get; set; }
		/// <summary>
		/// UserStateId
        /// </summary>
        public int UserStateId { get; set; }
		   
	}
}

