import React, {useEffect, useState} from 'react';
import ReactDOM from 'react-dom/client';

function PlacesList() {
    const [loading, setLoading] = useState(true);
    const [places, setPlaces] = useState([]);

    useEffect(() => {
        const apiEndpoint = '/api/places';
        fetch(apiEndpoint)
            .then(response => response.json())
            .then(data => {
                setPlaces(data.places);
                setLoading(false);
            });
    }, []);

    if (loading) {
        return (
            <div>Loading...</div>
        )
    } else {
        return (
            places.map((place, index) => {
                return <div key={index}>
                    <table>
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Citry</th>
                            <th>Recent Upload Speed</th>
                            <th>Number of measurements</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>{place.name}</td>
                            <td>{place.city}</td>
                            <td>{place.most_recent_download_speed} {place.most_recent_download_units}</td>
                            <td>{place.number_of_measurements}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            })
        )
    }
}

const placesList = ReactDOM.createRoot(document.getElementById('places-list-container'));
placesList.render(<PlacesList/>);
