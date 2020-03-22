

const Photo = function(image) {
  this.imageData = image.imageData;
  this.caption = image.caption;
  this.userId = image.userId;
  this.price = image.price;
  this.timeStamp = image.timeStamp;
};

module.exports= Photo;
