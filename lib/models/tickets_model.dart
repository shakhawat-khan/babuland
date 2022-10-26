class TicketModel {
  List<Items>? items;
  bool? hasMore;
  int? limit;
  int? offset;
  int? count;
  List<Links>? links;

  TicketModel(
      {this.items,
      this.hasMore,
      this.limit,
      this.offset,
      this.count,
      this.links});

  TicketModel.fromJson(Map<String, dynamic> json) {
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
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['hasMore'] = hasMore;
    data['limit'] = limit;
    data['offset'] = offset;
    data['count'] = count;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? pk;
  Null? customerIdFk;
  String? mobileNumber;
  int? total;
  int? discountAmount;
  int? subTotal;
  int? receivedAmount;
  int? returnAmount;
  String? paymentType;
  String? sellPerson;
  int? bunitFk;
  String? sellDate;
  String? couponCode;
  int? vat;
  Null? slType;
  Null? trnId;
  int? discountAble;
  String? discountCoupon;
  int? discountPct;
  int? vatableAmt;
  int? netAmt;
  Null? appAvil;
  Null? unixtimestamp;
  Null? usedBranch;
  Null? useDate;
  Null? startDate;

  Items(
      {this.pk,
      this.customerIdFk,
      this.mobileNumber,
      this.total,
      this.discountAmount,
      this.subTotal,
      this.receivedAmount,
      this.returnAmount,
      this.paymentType,
      this.sellPerson,
      this.bunitFk,
      this.sellDate,
      this.couponCode,
      this.vat,
      this.slType,
      this.trnId,
      this.discountAble,
      this.discountCoupon,
      this.discountPct,
      this.vatableAmt,
      this.netAmt,
      this.appAvil,
      this.unixtimestamp,
      this.usedBranch,
      this.useDate,
      this.startDate});

  Items.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    customerIdFk = json['customer_id_fk'];
    mobileNumber = json['mobile_number'];
    total = json['total'];
    discountAmount = json['discount_amount'];
    subTotal = json['sub_total'];
    receivedAmount = json['received_amount'];
    returnAmount = json['return_amount'];
    paymentType = json['payment_type'];
    sellPerson = json['sell_person'];
    bunitFk = json['bunit_fk'];
    sellDate = json['sell_date'];
    couponCode = json['coupon_code'];
    vat = json['vat'];
    slType = json['sl_type'];
    trnId = json['trn_id'];
    discountAble = json['discount_able'];
    discountCoupon = json['discount_coupon'];
    discountPct = json['discount_pct'];
    vatableAmt = json['vatable_amt'];
    netAmt = json['net_amt'];
    appAvil = json['app_avil'];
    unixtimestamp = json['unixtimestamp'];
    usedBranch = json['used_branch'];
    useDate = json['use_date'];
    startDate = json['start_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = pk;
    data['customer_id_fk'] = customerIdFk;
    data['mobile_number'] = mobileNumber;
    data['total'] = total;
    data['discount_amount'] = discountAmount;
    data['sub_total'] = subTotal;
    data['received_amount'] = receivedAmount;
    data['return_amount'] = returnAmount;
    data['payment_type'] = paymentType;
    data['sell_person'] = sellPerson;
    data['bunit_fk'] = bunitFk;
    data['sell_date'] = sellDate;
    data['coupon_code'] = couponCode;
    data['vat'] = vat;
    data['sl_type'] = slType;
    data['trn_id'] = trnId;
    data['discount_able'] = discountAble;
    data['discount_coupon'] = discountCoupon;
    data['discount_pct'] = discountPct;
    data['vatable_amt'] = vatableAmt;
    data['net_amt'] = netAmt;
    data['app_avil'] = appAvil;
    data['unixtimestamp'] = unixtimestamp;
    data['used_branch'] = usedBranch;
    data['use_date'] = useDate;
    data['start_date'] = startDate;
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
    data['rel'] = rel;
    data['href'] = href;
    return data;
  }
}
