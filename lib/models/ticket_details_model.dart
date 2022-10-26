class TicketDetailsModel {
  List<Items>? items;
  bool? hasMore;
  int? limit;
  int? offset;
  int? count;
  List<Links>? links;

  TicketDetailsModel(
      {this.items,
      this.hasMore,
      this.limit,
      this.offset,
      this.count,
      this.links});

  TicketDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    hasMore = json['hasMore'];
    limit = json['limit'];
    offset = json['offset'];
    count = json['count'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['hasMore'] = this.hasMore;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    data['count'] = this.count;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? pk;
  int? iteminfoFk;
  int? tslmsFk;
  String? dsc;
  int? tp;
  int? mrp;
  int? qty;
  int? discount;
  int? vat;
  int? bunitFk;
  int? isCombo;
  Null? appAvail;
  String? msmasteridOffersid;

  Items(
      {this.pk,
      this.iteminfoFk,
      this.tslmsFk,
      this.dsc,
      this.tp,
      this.mrp,
      this.qty,
      this.discount,
      this.vat,
      this.bunitFk,
      this.isCombo,
      this.appAvail,
      this.msmasteridOffersid});

  Items.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    iteminfoFk = json['iteminfo_fk'];
    tslmsFk = json['tslms_fk'];
    dsc = json['dsc'];
    tp = json['tp'];
    mrp = json['mrp'];
    qty = json['qty'];
    discount = json['discount'];
    vat = json['vat'];
    bunitFk = json['bunit_fk'];
    isCombo = json['is_combo'];
    appAvail = json['app_avail'];
    msmasteridOffersid = json['msmasterid_offersid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this.pk;
    data['iteminfo_fk'] = this.iteminfoFk;
    data['tslms_fk'] = this.tslmsFk;
    data['dsc'] = this.dsc;
    data['tp'] = this.tp;
    data['mrp'] = this.mrp;
    data['qty'] = this.qty;
    data['discount'] = this.discount;
    data['vat'] = this.vat;
    data['bunit_fk'] = this.bunitFk;
    data['is_combo'] = this.isCombo;
    data['app_avail'] = this.appAvail;
    data['msmasterid_offersid'] = this.msmasteridOffersid;
    return data;
  }
}

class Links {
  String? rel;
  String? href;

  Links({this.rel, this.href});

  Links.fromJson(Map<String, dynamic> json) {
    rel = json['rel'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rel'] = this.rel;
    data['href'] = this.href;
    return data;
  }
}
