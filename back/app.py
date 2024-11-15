from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Datos de ejemplo
tareas = [
    {'id': 1, 'titulo': 'Aprender Docker', 'completada': False},
    {'id': 2, 'titulo': 'Practicar Python', 'completada': True},
    {'id': 3, 'titulo': 'Estudiar React', 'completada': False}
]

@app.route('/api/tareas', methods=['GET'])
def get_tareas():
    return jsonify(tareas)

@app.route('/api/health', methods=['GET'])
def health_check():
    return jsonify({"status": "healthy"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
