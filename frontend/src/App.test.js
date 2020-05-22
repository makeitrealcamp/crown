import React from 'react';
import { render, waitFor } from '@testing-library/react';
import App from './App';

test('renders the map', async () => {
  const { container } = render(<App />);
  await waitFor(() => {
    expect(container.querySelector('.leaflet-container')).toBeInTheDocument();
  });
});
