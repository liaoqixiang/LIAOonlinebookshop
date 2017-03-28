using System; 
namespace LeoBookShop.Model
{
	public class BookComment
	{
   		     
      	/// <summary>
		/// Id
        /// </summary>
        public int Id { get; set; }
		/// <summary>
		/// Msg
        /// </summary>
        public string Msg { get; set; }
		/// <summary>
		/// CreateDateTime
        /// </summary>
        public DateTime CreateDateTime { get; set; }
		/// <summary>
		/// BookId
        /// </summary>
        public int BookId { get; set; }
		   
	}
}

