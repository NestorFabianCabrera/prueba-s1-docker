import { useState, useEffect } from 'react'
import './App.css'

// Asegurarnos de que exportamos correctamente el componente
export default function App() {
  const [tareas, setTareas] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  useEffect(() => {
    fetch('/api/tareas')
      .then(res => {
        if (!res.ok) throw new Error('Error al cargar las tareas')
        return res.json()
      })
      .then(data => {
        setTareas(data)
        setLoading(false)
      })
      .catch(err => {
        setError(err.message)
        setLoading(false)
        console.error('Error:', err)
      })
  }, [])

  if (loading) return <div className="container">Cargando...</div>
  if (error) return <div className="container error">Error: {error}</div>

  return (
    <div className="container">
      <h1>Lista de Tareas</h1>
      <ul className="task-list">
        {tareas.map(tarea => (
          <li 
            key={tarea.id}
            className={tarea.completada ? 'completed' : ''}
          >
            {tarea.titulo}
          </li>
        ))}
      </ul>
    </div>
  )
}
