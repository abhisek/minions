import js2py
import sys

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('Usage: python app.py <js_file>')
        sys.exit(1)

    js2py.disable_pyimport()
    with open(sys.argv[1], 'r') as f:
        js_code = f.read()
        result = js2py.eval_js(js_code)
        print(repr(result))
