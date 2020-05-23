import React from 'react';
import {
  render, waitFor, it, expect,
} from '@testing-library/react';
import App from './App';

it('renders the map', async () => {
  const { container } = render(<App />);
  await waitFor(() => {
    expect(container.querySelector('.leaflet-container')).toBeInTheDocument();
  });
});
