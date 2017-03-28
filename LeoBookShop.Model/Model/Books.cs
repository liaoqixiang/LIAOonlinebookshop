using System; 
namespace LeoBookShop.Model
{
	public class Books
	{
   		     
      	/// <summary>
		/// Id
        /// </summary>
        public int Id { get; set; }
		/// <summary>
		/// Title
        /// </summary>
        public string Title { get; set; }
		/// <summary>
		/// Author
        /// </summary>
        public string Author { get; set; }
		/// <summary>
		/// PublishDate
        /// </summary>
        public DateTime PublishDate { get; set; }
		/// <summary>
		/// ISBN
        /// </summary>
        public string ISBN { get; set; }
		/// <summary>
		/// UnitPrice
        /// </summary>
        public decimal UnitPrice { get; set; }
		/// <summary>
		/// CategoryId
        /// </summary>
        public int CategoryId { get; set; }
		
		   
	}
}

