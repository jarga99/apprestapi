"use strict";

var response = require("./res");
var connection = require("./koneksi");

var connection = require("./koneksi");
// var mysql = require("mysql");
var md5 = require("md5");
var response = require("./res");

var jwt = require("jsonwebtoken");
var config = require("./config/secret");
var ip = require("ip");

//controller untuk register
exports.registrasi = function (req, res) {
  var post = {
    username: req.body.username,
    email: req.body.email,
    password: md5(req.body.password),
    role: req.body.role,
    tanggal_daftar: new Date()
  }
  var query = "SELECT email FROM ?? WHERE ??";
  var table = ["tb_user", "email", post.email];

  query = connection.format(query, table);
  connection.query(query, function (error, rows) {
    if (error) {
      console.log(error);
    } else {
      if (rows.length == 0) {
        var query = "INSERT INTO ?? SET ?";
        var table = ["tb_user"];
        query = connection.format(query, table);
        connection.query(query, post, function (error, rows) {
          if (error) {
            console.log(error);
          } else {
            response.ok("Berhasil menambahkan data user baru", res);
          }
        });
      } else {
        response.ok("Email telah terdaftar");
      }
    }
  });
};


exports.index = function (req, res) {
  response.ok("Aplikasi REST API ku berjalan!", res);
};

//menampilkan semua data mahasiswa
exports.tampilsemuamahasiswa = function (req, res) {
  connection.query("SELECT * FROM tb_mahasiswa", function (
    error,
    rows,
    fileds
  ) {
    if (error) {
      connection.log(error);
    } else {
      response.ok(rows, res);
    }
  });
};

// menampilkan semua data mahasiswa berdasarkan idnya
exports.tampilberdasarkanid = function (req, res) {
  let id = req.params.id;
  connection.query(
    "SELECT * FROM tb_mahasiswa WHERE id_mahasiswa = ?",
    [id],
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        response.ok(rows, res);
      }
    }
  );
};

//Menbahkan data mahasiswa
exports.tambahdatamahasiswa = function (req, res) {
  var nim = req.body.nim;
  var nama = req.body.nama;
  var jurusan = req.body.jurusan;

  connection.query(
    "INSERT INTO tb_mahasiswa(nim, nama, jurusan) VALUES(?,?,?)",
    [nim, nama, jurusan],
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        response.ok("Berhasil Menambahkan Data!", res);
      }
    }
  );
};

//mengubah data berdasarkan id
exports.ubahdatamahasiswa = function (req, res) {
  var id = req.body.id_mahasiswa;
  var nim = req.body.nim;
  var nama = req.body.nama;
  var jurusan = req.body.jurusan;

  connection.query(
    "UPDATE tb_mahasiswa SET nim=?, nama=?, jurusan=? WHERE id_mahasiswa=?",
    [nim, nama, jurusan, id],
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        response.ok("berhasil ubah data mahasiswa", res);
      }
    }
  );
};

//menghapus data berdasarkan id
exports.hapusdatamahasiswa = function (req, res) {
  var id = req.body.id_mahasiswa;

  connection.query(
    "DELETE FROM tb_mahasiswa WHERE id_mahasiswa=?",
    [id],
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        response.ok("berhasil hapus data mahasiswa", res);
      }
    }
  );
};

//menampilkan matakuliah group
exports.tampilgroupmatakuilah = function (req, res) {
  connection.query(
    "SELECT tb_mahasiswa.id_mahasiswa, tb_mahasiswa.nim, tb_mahasiswa.nama, tb_mahasiswa.jurusan, tb_matakuliah.matakuliah, tb_matakuliah.sks from tb_krs JOIN tb_matakuliah JOIN tb_mahasiswa WHERE tb_krs.id_matakuliah = tb_matakuliah.id_matakuliah AND tb_krs.id_mahasiswa = tb_mahasiswa.id_mahasiswa ORDER BY tb_mahasiswa.id_mahasiswa",
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        response.oknested(rows, res);
      }
    }
  );
};
