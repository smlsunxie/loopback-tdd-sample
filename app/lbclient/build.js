var path = require('path');
var pkg = require('./package.json');
var fs = require('fs');
var browserify = require('browserify');
var boot = require('loopback-boot');
var targetdir = "../../client/scripts"

module.exports = function buildBrowserBundle(env, callback) {
  var b = browserify({ basedir: __dirname });
  b.require('./' + pkg.main, { expose: 'lbclient' });

  try {
    boot.compileToBrowserify({
      appRootDir: __dirname,
      env: env
    }, b);
  } catch(err) {
    return callback(err);
  }

  var bundlePath = path.resolve(__dirname, targetdir + '/bundle.js');
  var out = fs.createWriteStream(bundlePath);
  var isDevEnv = ~['debug', 'development', 'test'].indexOf(env);

  b.bundle({
    // TODO(bajtos) debug should be always true, the sourcemaps should be
    // saved to a standalone file when !isDev(env)
    debug: isDevEnv
  })
    .on('error', callback)
    .pipe(out);

  out.on('error', callback);
  out.on('close', callback);
};
