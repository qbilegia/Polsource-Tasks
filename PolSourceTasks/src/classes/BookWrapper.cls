global class BookWrapper implements Wrapper {

    public String name { get; set; }
    public String title { get; set; }
    public String author { get; set; }
    public Decimal isbn { get; set; }
    public Id publisherId { get; set; }
    public Id id { get; set; }
    public List<EditionWrapper> bookEditions { get; set; }

    public BookWrapper(Book__c book) {
        this.name = book.Name;
        this.title = book.Title__c;
        this.author = book.Author__c;
        this.id = book.Id;
        this.isbn = book.ISBN__c;
        this.publisherId = book.Publisher__c;
        bookEditions = new List<EditionWrapper>();
    }

    public Book__c getSObject() {
        Book__c book = new Book__c();
        book.Publisher__c = this.publisherId;
        book.Title__c = this.title;
        book.Author__c = this.author;
        book.ISBN__c = this.isbn;
        return book;
    }

    public String serialize() {
        return JSON.serialize(this);
    }

}