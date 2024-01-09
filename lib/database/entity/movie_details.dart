

import 'package:floor/floor.dart';

@entity
class MovieDetailEntity{
  @PrimaryKey(autoGenerate: true)
  int? movieId;


  String? customerName;
  String? customerEmail;
  String? customerId;
  String? contact;
  String? movieTitle;
  String? noOfTicket;
  String? dateNTime;


  MovieDetailEntity(
      {this.customerName,
        this.customerEmail,
        this.customerId,
        this.contact,
        this.movieTitle,
        this.noOfTicket,
        this.dateNTime,
        });
}