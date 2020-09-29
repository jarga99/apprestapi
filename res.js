"use strict";

exports.ok = function (values, res) {
  var data = {
    status: 200,
    values: values,
  };
  res.json(data);
  res.end();
};

//response untuk nested matakuliah
exports.oknested = function (values, res) {
  //lakukan akumulasi
  const hasil = values.reduce((akumulasikan, item) => {
    //tentukan key grub
    if (akumulasikan[item.nama]) {
      //buat nama variabel group nama mahasiswa
      const group = akumulasikan[item.nama];
      //cek jika isi array adalah matakuliah
      if (Array.isArray(group.tb_matakuliah)) {
        //tambahkan value ke dalam group matakuliah
        group.tb_matakuliah.push(item.tb_matakuliah);
      } else {
        group.tb_matakuliah = [group.tb_matakuliah, item.tb_matakuliah];
      }
    } else {
      akumulasikan[item.nama] = item;
    }
    return akumulasikan;
  }, {});

  var data = {
    status: 200,
    values: hasil,
  };

  res.json(data);
  res.end();
};
