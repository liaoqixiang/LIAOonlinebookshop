using System; 
namespace LeoBookShop.Model
{
	public class OrderBook
	{
   		     
      	/// <summary>
		/// Id
        /// </summary>
        public int Id { get; set; }
		/// <summary>
		/// UserID
        /// </summary>
        public int UserID { get; set; }
		/// <summary>
		/// Address
        /// </summary>
        public string Address { get; set; }
		/// <summary>
		/// totalprice
        /// </summary>
        public int TotalPrice { get; set; }
	
		   
	}
}

