using System; 
namespace LeoBookShop.Model
{
	public class Cart
	{
   		     
      	/// <summary>
		/// Id
        /// </summary>
        public int Id { get; set; }
		/// <summary>
		/// UserId
        /// </summary>
        public int UserId { get; set; }
		/// <summary>
		/// BookId
        /// </summary>
        public int BookId { get; set; }
		/// <summary>
		/// Count
        /// </summary>
        public int Count { get; set; }
		   
	}
}

