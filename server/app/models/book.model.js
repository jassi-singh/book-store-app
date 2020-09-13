module.exports = (sequelize, Sequelize) => {
    const Book = sequelize.define("book", {
      name: {
        type: Sequelize.STRING
      },
      writer: {
        type: Sequelize.STRING
      },
      image: {
        type : Sequelize.STRING
      },
      price : {
        type: Sequelize.INTEGER
      },
      favourite: {
        type: Sequelize.BOOLEAN
      },
      cart : {
        type: Sequelize.BOOLEAN
      }
    });
  
    return Book;
  };